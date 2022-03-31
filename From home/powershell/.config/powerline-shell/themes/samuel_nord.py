class DefaultColor(object):
    """
    This class should have the default colors for every segment.
    Please test every new segment with this theme first.
    """
    # RESET is not a real color code. It is used as in indicator
    # within the code that any foreground / background color should
    # be cleared
    RESET = -1

    USERNAME_FG = 250      #bcbcbc
    USERNAME_BG = 240      #585858
    USERNAME_ROOT_BG = 124 #af0000

    HOSTNAME_FG = 254  #e4e4e4
    HOSTNAME_BG = 12   #7aa6Da

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 4        #005f5f
    HOME_FG = 254      #e4e4e4
    PATH_BG = 238      #444444
    PATH_FG = 250      #bcbcbc
    CWD_FG = 254       #e4e4e4
    SEPARATOR_FG = 12  #7aa6Da

    READONLY_BG = 124
    READONLY_FG = 254

    SSH_BG = 166  # medium orange
    SSH_FG = 254

    REPO_CLEAN_BG = 148  # a light green color
    REPO_CLEAN_FG = 0  # black
    REPO_DIRTY_BG = 161  # pink/red
    REPO_DIRTY_FG = 15  # white

    JOBS_FG = 39
    JOBS_BG = 238

    CMD_PASSED_BG = 7   #c0c0c0
    CMD_PASSED_FG = 8   #808080
    CMD_FAILED_BG = 161 #d7005f
    CMD_FAILED_FG = 15  #ffffff

    SVN_CHANGES_BG = 148
    SVN_CHANGES_FG = 22  # dark green

    GIT_AHEAD_BG = 240     #585858
    GIT_AHEAD_FG = 250     #bcbcbc
    GIT_BEHIND_BG = 240    #585858
    GIT_BEHIND_FG = 250    #bcbcbc
    GIT_STAGED_BG = 71     #5fAf5f
    GIT_STAGED_FG = 15     #ffffff
    GIT_NOTSTAGED_BG = 11  #e7c548
    GIT_NOTSTAGED_FG = 15  #ffffff
    GIT_UNTRACKED_BG = 52  #5f0000
    GIT_UNTRACKED_FG = 15  #ffffff
    GIT_CONFLICTED_BG = 9  #ff0000
    GIT_CONFLICTED_FG = 15 #ffffff

    GIT_STASH_BG = 221 #ffd75f
    GIT_STASH_FG = 0   #000000

    VIRTUAL_ENV_BG = 35  # a mid-tone green
    VIRTUAL_ENV_FG = 0

    BATTERY_NORMAL_BG = 22
    BATTERY_NORMAL_FG = 7
    BATTERY_LOW_BG = 196
    BATTERY_LOW_FG = 7

    AWS_PROFILE_FG = 39
    AWS_PROFILE_BG = 238 #444444

    TIME_FG = 250 #bcbcbc
    TIME_BG = 238 #444444


class Color(DefaultColor):
    """
    This subclass is required when the user chooses to use 'default' theme.
    Because the segments require a 'Color' class for every theme.
    """
    pass
