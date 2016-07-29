class RunOnMinor < Formula
  VERSION = "1.1.2"

  desc "Run a command on all servers in the minor cluster, one by one"
  homepage "https://github.com/octoblu/ops-tools-run-on-minor"
  url "https://github.com/octoblu/ops-tools-run-on-minor/archive/v#{VERSION}.tar.gz"
  sha256 "3972e0e02b8bc539d86174dc8481dc0d62fd5fbd6899d44771466eb55515ac51"

  depends_on 'octoblu/tools/etcdsync'

  def install
    inreplace "run_on_minor.sh", 'local directory="$(script_directory)"', ""
    inreplace "run_on_minor.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "run_on_minor.sh", "run_on_minor"

    bin.install "run_on_minor"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/run_on_minor --version").strip
  end
end
