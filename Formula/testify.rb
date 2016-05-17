class Testify < Formula
  desc "Setup travis and mocha to run tests"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.0.0.tar.gz"
  version "3.0.0"
  sha256 "f301bc8a2f79a3fa461557cd50f4a6dbec0d8fe1ff55c59b68553ceb14247790"

  depends_on "octoblu/tools/travisify"

  def install
    inreplace "bash/testify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/testify\""
    bin.install "bash/testify"
    var.install "templates/testify"
  end
end
