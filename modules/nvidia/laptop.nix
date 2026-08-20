{pkgs, config, ...}: {
    hardware.graphics.enable = true;

    services.xserver.videoDrivers = ["amdgpu" "nvidia"];

    hardware.nvidia = {
        modesetting.enable = true;

        powerManagement.enable = false;

        powerManagement.finegrained = false;

        open = true;

        nvidiaSettings = true;

        package = config.lib.kernelPackages.nvidiaPackages.stable;

        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };

            #RUN nix shell nixpkgs#pciutils -c lspci -D -d ::03xx to get the values!!!

            nvidiaBusId = "REPLACEME";
            amdgpuBusId = "REPLACEME";
        };
    };
}