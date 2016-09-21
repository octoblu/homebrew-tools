class Testify < Formula
  desc "Setup travis and mocha to run tests"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.4.0.tar.gz"
  version "3.4.0"
  sha256 "4fc02ea9d49f17d22b47e5c3c0e9fbb4d98ae9be9dcaf2a3f279288dfd8d4bb1"

  depends_on "octoblu/tools/travisify"

  def install
    inreplace "bash/testify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/testify\""
    bin.install "bash/testify"
    var.install "templates/testify"
  end
end
