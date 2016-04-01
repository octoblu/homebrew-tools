class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  homepage "https://github.com/octoblu/node-dev-tools"
  url "https://github.com/octoblu/node-dev-tools/archive/v1.0.0.tar.gz"
  sha256 "dd82aab3c9dc1f1976ced600fe79762628de4c2714adc71531fa6ab965418c37"

  def install
    bin.install "bash/travisify"
  end
end
