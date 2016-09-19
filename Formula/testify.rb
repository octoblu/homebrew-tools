class Testify < Formula
  desc "Setup travis and mocha to run tests"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.1.2.tar.gz"
  version "3.1.2"
  sha256 "f8574274eb8d653cb12925489fc87310ce269b85d785055457c32002e1e09312"

  depends_on "octoblu/tools/travisify"

  def install
    inreplace "bash/testify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/testify\""
    bin.install "bash/testify"
    var.install "templates/testify"
  end
end
