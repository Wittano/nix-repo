{ lib
, stdenv
, fetchFromGitHub
, linuxPackages
, kernel ? linuxPackages.kernel
, bc
, kmod
}: stdenv.mkDerivation {
  name = "rtl8192eu-linux-driver";
  version = "4.4.0";

  src = fetchFromGitHub {
    owner = "Mange";
    repo = "rtl8192eu-linux-driver";
    rev = "f2fc8af7ab58d2123eed1aa4428e713cdfc27976";
    sha256 = "sha256-OgsxBcXoIP8h9Z0bLsG91/s/+r89Tdn2dPOt4p3sx8k=";
  };

  enableParallelBuilding = true;
  nativeBuildInputs = [ bc kmod kernel.moduleBuildDependencies ];

  makeFlags = kernel.makeFlags ++ [
    "KVER=${kernel.modDirVersion}"
    "KSRC=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
  ];

  hardeningDisable = [ "format" "pic" ];

  installPhase = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}/misc
    for x in $(find . -name '*.ko' -type f); do
      cp $x $out/lib/modules/${kernel.modDirVersion}/misc/
    done
  '';

  meta = with lib; {
    homepage = "https://github.com/Mange/rtl8192eu-linux-driver/tree/realtek-4.4.x";
    description = "Linux Wifi Driver for rtl8192eu(e.g. TpLink wifi adapter) devices";
    maintainers = with maintainers; [ Wittano ];
    platforms = platforms.linux;
  };
}
