class Testify < Formula
  desc "Setup travis and mocha to run tests"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.3.0.tar.gz"
  version "3.3.0"
  sha256 "f0f921cd13308b11d3e77b63f44852e0086d41e8b39c2cea66296522826b5373"

  depends_on "octoblu/tools/travisify"

  def install
    inreplace "bash/testify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/testify\""
    bin.install "bash/testify"
    var.install "templates/testify"
  end
end
