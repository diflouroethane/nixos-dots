{pkgs, config, ...}: {
    hardware.graphics.enable = true;

    services.xserver.videoDrivers = ["amdgpu" "nvidia"];

    hardware.nvidia = {
        modesetting.enable = true;

        powerManagement.enable = false;

        powerManagement.finegrained = false;

        open = true;

        nvidiaSettings = true;

        package = config.boot.kernelPackages.nvidiaPackages.stable;

        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };

            #RUN nix shell nixpkgs#pciutils -c lspci -D -d ::03xx to get the values!!!

            nvidiaBusId = "PCI:1@0:0:0";
            amdgpuBusId = "PCI:74@0:0:0";
        };
    };
}
