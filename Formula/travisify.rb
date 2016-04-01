class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  homepage "https://github.com/octoblu/node-dev-tools"
  url "https://github.com/octoblu/node-dev-tools/archive/v1.0.1.tar.gz"
  sha256 "781893dbc49f41e898a43dcb2a0099ada1d2d609f3f230ab2173ba24b0bada9b"

  def install
    bin.install "bash/travisify"
  end
end
