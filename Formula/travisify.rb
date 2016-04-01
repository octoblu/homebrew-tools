class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  homepage "https://github.com/octoblu/node-dev-tools"
  url "https://github.com/octoblu/node-dev-tools/archive/v1.0.2.tar.gz"
  sha256 "a760b794d24bd6eee33389b15142ccc7a8a1f8f8c46c48c028208625a5e3f5b9"

  def install
    inreplace "bash/travisify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/travisify\""
    bin.install "bash/travisify"
    var.install "templates/travisify"
  end
end
