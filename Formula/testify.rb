class Testify < Formula
  desc "Setup travis and mocha to run tests"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.3.3.tar.gz"
  version "3.3.3"
  sha256 "2e3a7e9b95710e8d4aec840f95b07f93f5b6ef9b4209a56b66c52ed2fd7af78f"

  depends_on "octoblu/tools/travisify"

  def install
    inreplace "bash/testify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/testify\""
    bin.install "bash/testify"
    var.install "templates/testify"
  end
end
