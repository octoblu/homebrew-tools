class Testify < Formula
  desc "Setup travis and mocha to run tests"
  homepage "https://github.com/octoblu/node-dev-tools"
  url "https://github.com/octoblu/node-dev-tools/archive/v1.0.0.tar.gz"
  sha256 "dd82aab3c9dc1f1976ced600fe79762628de4c2714adc71531fa6ab965418c37"

  depends_on "octoblu/tools/travisify"

  def install
    bin.install "bash/testify"
  end
end
