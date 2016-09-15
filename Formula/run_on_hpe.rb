class RunOnHpe < Formula
  VERSION = "1.0.0"

  desc "Run a command on all servers in the hpe cluster, one by one"
  homepage "https://github.com/octoblu/ops-tools-run-on-hpe"
  url "https://github.com/octoblu/ops-tools-run-on-hpe/archive/v#{VERSION}.tar.gz"
  sha256 "4147cf64ae6c5073ad98e3ec82c5902cc590df1d2a16595894ecc34f3527769d"

  depends_on 'octoblu/tools/etcdsync'

  def install
    inreplace "run_on_hpe.sh", 'local directory="$(script_directory)"', ""
    inreplace "run_on_hpe.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "run_on_hpe.sh", "run_on_hpe"

    bin.install "run_on_hpe"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/run_on_hpe --version").strip
  end
end
