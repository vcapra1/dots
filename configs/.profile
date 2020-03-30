paths_pre=(
  "$HOME/.cargo/bin"
  "/usr/local/go/bin"
  "/opt/cuda/nvvm/bin"
  "$HOME/.local/bin"
  "$HOME/bin"
  "$HOME/.perl5/bin"
  "/opt/ctf-tools/bin"
  "$HOME/.rbenv/bin"
  "$HOME/.idaedu-7.3"
  "/usr/local/texlive/2019/bin/x86_64-linux"
)

paths_post=(
  "/opt/cuda/bin"
)

for p in $paths_pre; do
    PATH="$p:$PATH"
done

for p in $paths_post; do
    PATH="$PATH:$p"
done

unset p

PERL5LIB="/home/vinnie/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/vinnie/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/vinnie/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/vinnie/.perl5"; export PERL_MM_OPT;
