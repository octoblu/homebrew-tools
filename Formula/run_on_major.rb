class RunOnMajor < Formula
  VERSION = "1.1.2"

  desc "Run a command on all servers in the major cluster, one by one"
  homepage "https://github.com/octoblu/ops-tools-run-on-major"
  url "https://github.com/octoblu/ops-tools-run-on-major/archive/v#{VERSION}.tar.gz"
  sha256 "bb70512153b2f346d96ea35f16573b23a48b07b26d643bfe6cce748fb1eec22b"

  depends_on 'octoblu/tools/etcdsync'

  def install
    inreplace "run_on_major.sh", 'local directory="$(script_directory)"', ""
    inreplace "run_on_major.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "run_on_major.sh", "run_on_major"

    bin.install "run_on_major"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/run_on_major --version").strip
  end
end
