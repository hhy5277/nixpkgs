{ stdenv, fetchurl, cmake, unzip, boost, libjpeg, libtiff, libpng, openexr, ilmbase }:

stdenv.mkDerivation rec {
  name = "oiio-${version}";
  version = "1.1.8";

  src = fetchurl {
    url = "https://github.com/OpenImageIO/oiio/archive/Release-${version}.zip";
    sha256 = "08a6qhplzs8kianqb1gjgrndg81h3il5531jn9g6i4940b1xispg";
  };

  buildInputs = [ cmake unzip boost libjpeg libtiff libpng openexr ilmbase ];

  configurePhase = "";

  buildPhase = "make ILMBASE_HOME=${ilmbase} OPENEXR_HOME=${openexr} USE_PYTHON=0 INSTALLDIR=$out dist_dir=";

  installPhase = "echo hallo";

  meta = with stdenv.lib; {
    homepage = http://www.openimageio.org;
    description = "A library for reading and writing images";
    license = licenses.bsd3;
    maintainers = [ maintainers.goibhniu ];
    platforms = platforms.linux;
  };
}