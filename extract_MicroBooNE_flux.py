# MicroBooNE Flux File on Fermilab                                  
# /pnfs/uboone/persistent/uboonebeam/bnb_gsimple/bnb_gsimple_fluxes_01.09.2019_463_hist/   
# Code written by Josh to change root file to .dat file
import ROOT
import numpy as np


def main():

    input_file = "MCC9_FluxHist_volTPCActive.root"
    inFluxRootFile = ROOT.TFile(input_file, 'READ')
    # tdir = inFluxRootFile.cd("numu_ms_total")


    tree_dict = {}
    tree_keys = []
    for key in inFluxRootFile.GetListOfKeys():
       tree_dict[key.GetName()] = key.ReadObj()
       tree_keys.append(key.GetName())
    # Print what's in the file:
    # print(tree_keys)

    # # If you want to look at a variation's unisims:
    # fluxDir = tree_dict["numu_ms_total"]
    # flux_tree_dict = {}
    # flux_tree_keys = []
    # for key in fluxDir.GetListOfKeys():
    #    flux_tree_dict[key.GetName()] = key.ReadObj()
    #    flux_tree_keys.append(key.GetName())
    # assert 1==2
    # print(flux_tree_keys)
    # numUni = len(flux_tree_keys)
    # i=-1
    # for key in flux_tree_keys:
    #     i+=1
    #     thisFluxHist = flux_tree_dict[key]
    #     if i == 0:
    #         print("Number of Energy Bins:",thisFluxHist.GetNbinsX())
    #         for binIdx in range(thisFluxHist.GetNbinsX()):
    #             print(binIdx+1, thisFluxHist.GetBinCenter(binIdx+1))

    # Lets look at the cv flux for numus/antinumus:
    #
    # Scalefactor from the readme.txt file associated with Zarko's Flux files.
    # Multiply flux by this to normalize to nu/POT/bin/cm2
    # Comes from:
    # There are 4997 gsimple files each with 5e8 protons each.
    # The volTPCActive cross section area is 256.35*233cm^2.
    # Note scale factor probably doesn't matter if just taking a ratio of fluxes.
    scaleFactor=1/(4997.*5e8)/(256.35*233.)
    # CosTheta angle defined as theta = 0 (above), costheta = 1
    # This is done to assume neutrinos don't pass through the earth (icecube framework)
    # Which is appropriate for MicroBooNE which has little earthly contact.
    cosTheta = 1
    cv_numu_flux_h = tree_dict["hEnumu_cv"]
    cv_numubar_flux_h = tree_dict["hEnumubar_cv"]
    print("Number of Energy Bins:",cv_numu_flux_h.GetNbinsX())
    # Lets write to an output file as costheta/enu/numuflux/numubarflux
    # This is the format nusquidsdecay expects.
    # outputFluxDat = open("MicroBooNE_SQuIDSFormat_Flux_NumuAndAntiNuMu.dat")
    numpyArrayToWrite = np.zeros((cv_numu_flux_h.GetNbinsX(),4))
    numpyArrayToWrite[:,0] = cosTheta
    for binIdx in range(cv_numu_flux_h.GetNbinsX()):
        assert cv_numu_flux_h.GetBinCenter(binIdx+1) == cv_numubar_flux_h.GetBinCenter(binIdx+1)
        energy_gev = cv_numu_flux_h.GetBinCenter(binIdx+1)
        numuFlux = cv_numu_flux_h.GetBinContent(binIdx+1)*scaleFactor
        numubarFlux = cv_numubar_flux_h.GetBinContent(binIdx+1)*scaleFactor
        numpyArrayToWrite[binIdx,1] = energy_gev
        numpyArrayToWrite[binIdx,2] = numuFlux
        numpyArrayToWrite[binIdx,3] = numubarFlux

    # Write the output to a dat file.
    np.savetxt("MicroBooNE_SQuIDSFormat_Flux_NumuAndAntiNuMu.dat",numpyArrayToWrite)



if __name__ == '__main__':
    main()
