{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "pyinstrument";
  version = "5.0.0";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "joerick";
    repo = "pyinstrument";
    tag = "v${version}";
    hash = "sha256-uJ9KRgSETuxpeEIpBKFz66+Qci86jy36lKkUKpvmKIg=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  # Module import recursion
  doCheck = false;

  pythonImportsCheck = [ "pyinstrument" ];

  meta = with lib; {
    description = "Call stack profiler for Python";
    mainProgram = "pyinstrument";
    homepage = "https://github.com/joerick/pyinstrument";
    changelog = "https://github.com/joerick/pyinstrument/releases/tag/v${version}";
    license = licenses.bsd3;
    maintainers = with maintainers; [ onny ];
  };
}
