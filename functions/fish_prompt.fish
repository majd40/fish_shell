function fish_prompt
    set_color white --bold
    echo -n '$ '(basename (pwd))

    # Check if the current directory is a Git repository
    if test -d .git
        # Check if HEAD exists
        if test -e .git/HEAD
            # Get the current Git branch
            set git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
            echo -n " $git_branch"

            # Check if there are uncommitted changes (dirty repository)
            git diff --quiet
            if not test $status -eq 0
                echo -n "~"
            end
        end
    end

    echo -n ' '
end

