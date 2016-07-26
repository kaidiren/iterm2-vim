oldpath=$(pwd)
basepath=$(cd; pwd)
destpath="$basepath/.iterm2/scripts"
url="https://raw.githubusercontent.com/kaidiren/iterm2-vim/master/vim.scpt"

if [ ! -d "$destpath" ]; then
  mkdir $destpath
fi
cd $destpath
curl -o vim.scpt $url
cd $oldpath

echo "done! 🍻"
