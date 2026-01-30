{
  perSystem =
    { pkgs, ... }:
    {
      packages.terraform-refplace = pkgs.writeShellApplication {
        name = "terraform-refplace";
        text = ''
          module="$1"
          ref="$2"
          shift 2

          module_regex="''${module//\*/.*}"

          for file in "$@"; do
            sed -E -i.bak "s|(source\s*=\s*\"[^\"]*''${module_regex}[^\"]*\?ref=)([^\"]*)\"|\1$ref\"|" "$file"
            if ! cmp -s "$file" "$file.bak"; then
              echo "Refplaced: $file"
            fi
            rm "$file.bak"
          done
        '';
      };
    };
}
