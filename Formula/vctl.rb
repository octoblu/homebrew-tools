class Vctl < Formula
  desc "Control vulcan with support for our custom job-logger middleware"
  homepage "https://github.com/octoblu/vulcand-bundle"
  url "https://github.com/octoblu/vulcand-bundle/archive/v1.3.1.tar.gz"
  sha256 "14dcb73e43cd04e9ddb4928602532604fc67eef015aa20b5893b0ffff8edd3d9"

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
    system "#{bin}/vctl", "version"
  end
end
