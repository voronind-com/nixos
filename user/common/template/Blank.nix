{
	description = "";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs } @inputs: let
		system = "x86_64-linux";
		lib    = nixpkgs.lib;
		pkgs   = nixpkgs.legacyPackages.${system};
	in {
		devShells.${system} = {
			default = pkgs.mkShell rec {
				nativeBuildInputs = with pkgs; [ ];
				buildInputs = with pkgs; [ ];

				SOURCE_DATE_EPOCH = "${toString self.lastModified}";
			};
		};
	};
}
