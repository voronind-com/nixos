# Intel CPU specific configuration.
{ ... }: {
	boot.kernelModules = [ "kvm-intel" ];
}
