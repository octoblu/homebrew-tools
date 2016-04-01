class Testify < Formula
  desc "Setup travis and mocha to run tests"
  homepage "https://github.com/octoblu/node-dev-tools"
  url "https://github.com/octoblu/node-dev-tools/archive/v1.0.2.tar.gz"
  sha256 "a760b794d24bd6eee33389b15142ccc7a8a1f8f8c46c48c028208625a5e3f5b9"

  depends_on "octoblu/tools/travisify"

  def install
    inreplace "bash/testify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/testify\""
    bin.install "bash/testify"
    var.install "templates/testify"
  end
end
