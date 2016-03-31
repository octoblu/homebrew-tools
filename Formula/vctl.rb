class Vctl < Formula
  desc "Control vulcan with support for our custom job-logger middleware"
  homepage "https://github.com/octoblu/vulcand-bundle"
  url "https://github.com/octoblu/vulcand-bundle/archive/v1.3.1.tar.gz"
  sha256 "14dcb73e43cd04e9ddb4928602532604fc67eef015aa20b5893b0ffff8edd3d9"

  bottle do
    root_url "https://github.com/octoblu/vulcand-bundle/releases/download/v1.3.1"
    cellar :any_skip_relocation
    sha256 "1f7af91b774413d6875d15ae41aa980bbcca20b7a7eae9f58720a07008ccf158" => :el_capitan
    sha256 "45a9a0abaa2ed2e63a966e44abff61c44b6fe7b5ac0804af951bc8d822be1b6f" => :yosemite
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = File.join buildpath, "go"
    ENV["GO15VENDOREXPERIMENT"] = "1"
    mkdir_p "go/src/github.com/octoblu"
    ln_s buildpath, "go/src/github.com/octoblu/vulcand-bundle"
    system "go", "build", "-o", "vctl-bundle", "github.com/octoblu/vulcand-bundle/vctl"
    move "vctl", "out-of-the-way"
    move "vctl-bundle", "vctl"
    bin.install "vctl"
  end

  test do
    system "#{bin}/vctl", "--version"
  end
end
