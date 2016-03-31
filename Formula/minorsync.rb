# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Minorsync < Formula
  desc "Sync etcd values to the minor cluster"
  homepage "https://github.com/octoblu/ops-tools"
  url "https://github.com/octoblu/ops-tools/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "8b41e191a568042bee24af64bacd12e9bc0a27bd235445f342cf1ab0089c1a04"

  depends_on 'octoblu/tools/etcdsync'

  def install
    bin.install "bash/minorsync"
  end

  test do
    system "#{bin}/minorsync", "--help"
  end
end
