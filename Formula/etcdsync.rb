class Etcdsync < Formula
  desc "Map etcd key/values to the local filesystem"
  homepage "https://github.com/royvandewater/etcdsync"
  url "https://github.com/royvandewater/etcdsync/archive/v1.1.2.tar.gz"
  sha256 "a5ff2b6d49a29fcfe3d5837ff2374a44cb986b27f9bcca4789f9224b9442a129"

  bottle do
    root_url "https://github.com/royvandewater/etcdsync/releases/download/v1.1.2"
    cellar :any_skip_relocation
    sha256 "801949c2baf5a70025b265fd607f52a6e61f20e21c97f815924d53e45084d17c" => :el_capitan
    sha256 "b64c1e497af674e11c7b09ca5eca6e62d85305b0547ee5d6215368a9989dc588" => :yosemite
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = File.join buildpath, "go"
    ENV["GO15VENDOREXPERIMENT"] = "1"
    mkdir_p "go/src/github.com/royvandewater"
    ln_s buildpath, "go/src/github.com/royvandewater/etcdsync"
    system "ls", "-l", "go/src/github.com/royvandewater/"
    system "go", "build", "github.com/royvandewater/etcdsync"
    bin.install "etcdsync"
  end

  test do
    assert_equal "etcdsync version 1.1.2", shell_output("#{bin}/etcdsync --version", 0).strip
  end
end
