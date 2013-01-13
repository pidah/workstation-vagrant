Description
===========

Requirements
============

  * git
  * vim

Attributes
==========

   * node[workstation][user] - User where dotfiles will be installed.  Defaults
     to the current user running chef or "vagrant" if ran under "vagrant
     provision"
   * node[workstation][home_directory] - directory where dotfiles will be
     installed.  Defaults to the node[workstation][user]'s home directory
   * node[workstation][name] - name for logging into git commits
   * node[workstation][email] - email for logging into git commits

Usage
=====

Add recipe[workstation::default] to your run list.
