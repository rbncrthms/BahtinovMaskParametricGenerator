# BahtinovMaskParametricGenerator
This generates a Bahtinov mask to aid astronomical focusing of a camera lens or telescope.

## How to use it
This requires [OpenSCAD](https://openscad.org/) to build. You can use that to produce an STL file that can be used with a 3D printer.

You can change the parameters as you require. They are as follows:

capDiam is the diameter of the end of the telescope or lens in mm plus a margin for tolerance purposes. Ideally you will set this so that the cap is neither too tight nor too loose. I added a 1.5mm margin which worked well for my purpose.

outerDiam is the diameter of the primary mirror or lens in mm.

innerDiam is the diameter of the area near the centre that should remain solid in mm. For a reflector telescope, this will be the diameter of your secondary mirror. For a refractor or a lens, this can be set a lot smaller, but I would not try a zero setting (maybe at least 5-10mm).

focalLen is the focal length of your telescope or lens in mm.

BahtinovFactor is the same as the parameter in the excellent [Bahtinov Mask Drawings Generator](https://satakagi.github.io/tribahtinovWebApps/Bahtinov.html) upon which this work is based.

You can then make an STL file and then use a slicer and a 3D printer to make yourself a Bahtinov mask!

The parameters provided are set up for a Celestron 125mm AstroFi Schmitt-Cassegrain telescope; they will need setting for your specific application, of course.
