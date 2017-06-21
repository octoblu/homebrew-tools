class Bashblu < Formula
  VERSION = "3.0.3"

  desc "Generate bash scripts"
  url "https://github.com/octoblu/unix-dev-tools-bashblu/archive/v#{VERSION}.tar.gz"
  sha256 "5136b4f6bf02702f8208ae544026906d7c419c5759f3aefedd9be50afc840f86"

  def install
    inreplace "bashblu.sh", '# HOMEBREW HOOK: version', "echo \"#{VERSION}\" && return 0"
    inreplace "bashblu.sh", '# HOMEBREW HOOK: get_template', "cat \"#{prefix}/basic-script.sh\" && return 0"

    move "bashblu.sh", "bashblu"

    prefix.install "VERSION"
    prefix.install "templates/basic-script.sh"
    bin.install "bashblu"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/bashblu --version").strip
  end
end
