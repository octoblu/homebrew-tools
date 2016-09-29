class Bashblu < Formula
  VERSION = "2.0.1"

  desc "Generate bash scripts"
  url "https://github.com/octoblu/unix-dev-tools-bashblu/archive/v#{VERSION}.tar.gz"
  sha256 "03fbcabf96a2dbe0e714ea135e3cc988b8ee19106d093c52a79d4cda739f3a10"

  def install
    inreplace "bashblu.sh", 'local directory="$(script_directory)"', ""
    inreplace "bashblu.sh", 'echo "unknown"', "echo '#{VERSION}'"

    move "bashblu.sh", "bashblu"

    bin.install "bashblu"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/bashblu --version").strip
  end
end
