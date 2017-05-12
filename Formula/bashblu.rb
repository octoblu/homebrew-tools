class Bashblu < Formula
  VERSION = "3.0.1"

  desc "Generate bash scripts"
  url "https://github.com/octoblu/unix-dev-tools-bashblu/archive/v#{VERSION}.tar.gz"
  sha256 "9d66075f709dfd7b89d515703d5675c1562fe32804b12f34c305f4953eb78153"

  def install
    inreplace "bashblu.sh", 'local directory="$(script_directory)"', ""
    inreplace "bashblu.sh", 'echo "unknown-version"', "echo '#{VERSION}'"

    move "bashblu.sh", "bashblu"

    bin.install "bashblu"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/bashblu --version").strip
  end
end
