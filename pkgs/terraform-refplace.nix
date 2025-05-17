{
  writeShellApplication,
}:
writeShellApplication {
  name = "terraform-refplace";
  text = ''
    function show_help() {
      echo "Utility command for updating the version of many Terraform modules at once"
      echo ""
      echo "Usage: terraform-update-git-refs <module> <ref>"
      echo ""
      echo "Options:"
      echo "-d  Directory to recursively search. Defaults to current working directory."
    }

    directory="$(pwd)"

    while getopts "d:h" opt; do
      case "$opt" in
        d) directory="$OPTARG" ;;
        h) show_help ;;
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
      esac
    done

    shift $((OPTIND - 1))

    if [ $# -lt 2 ]; then
      show_help
      exit 1
    fi

    module="$1"
    ref="$2"

    find "$directory" -type f -name "*.tf" | while read -r file; do
      sed -E -i "s|source = \"([^\"]*/?$module\?ref=)([^\"]*)\"|source = \"\1$ref\"|" "$file"
    done
  '';
}
