class Etcdsync < Formula
  desc "Map etcd key/values to the local filesystem"
  homepage "https://github.com/royvandewater/etcdsync"
  url "https://github.com/royvandewater/etcdsync/archive/v1.1.2.tar.gz"
  sha256 "a5ff2b6d49a29fcfe3d5837ff2374a44cb986b27f9bcca4789f9224b9442a129"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = File.join buildpath, "go"
    mkdir_p "go/src/github.com/royvandewater"
    ln_s buildpath, "go/src/github.com/royvandewater/etcdsync"
    system "ls", "-l", "go/src/github.com/royvandewater/"
    system "go", "build", "github.com/royvandewater/etcdsync"
    bin.install "etcdsync"
  end

  test do
    system "go", "test"
  end
end
