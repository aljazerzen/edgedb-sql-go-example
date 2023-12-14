let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkgs.go
    pkgs.edgedb
  ];
}
