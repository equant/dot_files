cd ~


###########################################################
# Vim stuff

for file in ".vimrc" ".vim"; do
    target="$HOME/nathan/git/dot_files/${file#.}"  # strips the leading dot for the target name
    link="$HOME/$file"
    
    if [ -e "$link" ] || [ -L "$link" ]; then
        echo "Backing up existing $file to $file.old"
        mv "$link" "$link.old"
    fi

    echo "Linking $file -> $target"
    ln -s "$target" "$link"
done


###########################################################
# Add git .bashrc into .bashrc

echo "

if [ -f ~/nathan/git/dot_files/bashrc ]; then
    . ~/nathan/git/dot_files/bashrc
fi 

" >> ~/.bashrc


###########################################################
# Notes file is a symlink to Sync dir (if sync ise setup)

if [ -d "$HOME/Sync/notes" ]; then
    notes_file="$HOME/Sync/notes/notes-$HOSTNAME.txt"
    
    if [ ! -f "$notes_file" ]; then
        echo "No notes file found for hostname: $HOSTNAME. Creating blank file."
        touch "$notes_file"
    fi

    if [ ! -e notes.txt ]; then
        echo "Linking notes file for hostname: $HOSTNAME"
        ln -s "$notes_file" notes.txt
    else
        echo "notes.txt already exists."
    fi
fi
