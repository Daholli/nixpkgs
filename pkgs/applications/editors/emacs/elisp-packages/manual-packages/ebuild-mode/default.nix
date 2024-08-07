{
  lib,
  melpaBuild,
  fetchzip,
  writeText,
}:

melpaBuild rec {
  pname = "ebuild-mode";
  version = "1.72";

  src = fetchzip {
    url = "https://gitweb.gentoo.org/proj/ebuild-mode.git/snapshot/ebuild-mode-${version}.tar.bz2";
    hash = "sha256-GFEDWT88Boz/DxEcmFgf7u2NOoMjAN05yRiYwoYtvXc=";
  };

  # not used but needs to be set; why?
  commit = "a643f177b58aa8869f2f24814e990320aa4f0f96";

  recipe = writeText "recipe" ''
    (ebuild-mode
     :url "https://gitweb.gentoo.org/proj/ebuild-mode.git"
     :fetcher git)
  '';

  meta = {
    homepage = "https://gitweb.gentoo.org/proj/ebuild-mode.git/";
    description = "Major modes for Gentoo package files";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [ qyliss ];
  };
}
