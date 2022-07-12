cd ~

ln -s ~/Sync/git/dot_files/vimrc .vimrc
ln -s ~/Sync/git/dot_files/vim .vim

echo "

if [ -f ~/Sync/git/dot_files/bashrc ]; then
    . ~/Sync/git/dot_files/bashrc
fi 

" >> ~/.bashrc


# use hostname
#ln -s ~/Sync/notes/notes-biko.txt notes.txt

cd ~/bin
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
