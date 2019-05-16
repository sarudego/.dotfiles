import os
import subprocess
import time
import re
import shutil
from tempfile import mkstemp
from os.path import expanduser

# This script requires Python 3

# subprocess.Popen(["git","clone", repo['clone_url']], cwd=CLONE_DIR)

# This script will be hardening
# access by ssh and configure fail2ban
# and some features:
# Add to a new user for the system and change password root.


def show_info(task):
  time.sleep(3)
  print("\n\n [x] ",task)


def skip_task():
  answer = input("Do you want skip this step? [Yy/Nn]: ")
  answer = answer.upper()
  if answer != 'Y' and answer != 'N':
    print('Only Yy/Nn is allowed')
    skip_task()
  if answer == 'Y':
    re_answer = input("Are you sure? [Yy/Nn]: ")
    re_answer = re_answer.upper()
    if re_answer == 'Y':
      return 1
    else:
      return 0


def sed(pattern, replace, source, dest=None, count=0):
  """Reads a source file and writes the destination file.

  In each line, replaces pattern with replace.

  Args:
  pattern (str): pattern to match (can be re.pattern)
  replace (str): replacement str
  source  (str): input filename
  count (int): number of occurrences to replace
  dest (str):   destination filename, if not given, source will be over written.
  """

  fin = open(source, 'r')
  num_replaced = count

  if dest:
    fout = open(dest, 'w')
  else:
    fd, name = mkstemp()
    fout = open(name, 'w')

  for line in fin:
    out = re.sub(pattern, replace, line)
    fout.write(out)

    if out != line:
      num_replaced += 1
    if count and num_replaced > count:
      break
  try:
    fout.writelines(fin.readlines())
  except Exception as E:
    raise E

  fin.close()
  fout.close()

  if not dest:
    shutil.move(name, source)



def install_vim():
  show_info("Installing vim...")
  answer = skip_task()
  if not answer:
    test_vim=subprocess.call(["pacman", "-Qs", "vim"])
    if test_vim == '' :
      print('Vim is installed...')
    else:
      subprocess.call(["pacman", "-S", "--noconfirm", "vim"])
      print('Vim installed done.')


def change_root_password():
  show_info("Changing root password...")
  answer = skip_task()
  if not answer:
    os.system("passwd root")
    print('Change root password done.')


def add_new_user():
  show_info("Adding new user...")
  answer = skip_task()
  if not answer:
    new_user = input("Tell me a user name: ")
    subprocess.call(["useradd", "-m", "-g", "wheel", "-r", new_user])
    print("Added new user.")
    show_info("Changing {} password...".format(new_user))
    os.system("passwd {}".format(new_user))
    #subprocess.call(["sed", "-i", "--", "'s/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g'", "/etc/sudoers"])
    sed('# %wheel ALL=(ALL) ALL', '%wheel ALL=(ALL) ALL', '/etc/sudoers')
    print('Create new user done.')
    return new_user


def install_fail2ban():
  show_info("Installing fail2ban...")
  answer = skip_task()
  if not answer:
    test_fail2ban=subprocess.call(["pacman", "-Qs", "fail2ban"])
    if test_fail2ban == '' :
      print('Fail2ban is installed...')
    else:
      subprocess.call(["pacman", "-S", "--noconfirm", "fail2ban"])
      print('Fail2ban installed done.')
    show_info("Modifying config fail2ban...")
    # TODO: fix this

#     subprocess.call(["cp", "/etc/fail2ban/jail.conf", "/etc/fail2ban/jail.conf.backup"])
#     # add this below line after [sshd]
#     #  enabled  = true
#     #subprocess.call(["sed", "'/\[sshd\]/a enabled=true'", "/etc/fail2ban/jail.conf"])
#     sed('\n/[sshd/]', '\n/[sshd/] enabled=true', '/etc/fail2ban/jail.conf')

#     #sed('/\[sshd\]/a enabled=true','/etc/fail2ban/jail.conf')
#     show_info("Restarting fail2ban service...")
#     subprocess.call(["systemctl", "restart", "fail2ban"])
#     subprocess.call(["systemctl", "status", "fail2ban"])


def regenerate_ssh_keys():
  show_info("Regenerate ssh keys...")
  answer = skip_task()
  if not answer:
    subprocess.call(["ssh-keygen", "-t", "dsa", "-f", "/etc/ssh/ssh_host_dsa_key"])
    subprocess.call(["ssh-keygen", "-t", "rsa", "-f", "/etc/ssh/ssh_host_rsa_key"])
    print('Done.')


def regenerate_moduli():
  #TODO: fix this
  show_info("Regenerate moduli... this step can take some minutes...")
  answer = skip_task()
  if not answer:
    subprocess.call(["ssh-keygen", "-G", "moduli-2048.candidates", "-b", "2048"])
    subprocess.call(["ssh-keygen", "-T", "moduli-2048", "-f", "moduli-2048.candidates"])
    subprocess.call(["cp", "moduli-2048", "/etc/ssh/moduli"])
    subprocess.call(["rm", "moduli-2048"])
    print('Done.')


def modify_config_sshd(new_user):
  #TODO: fix this
  show_info("Modifying config sshd...")
  answer = skip_task()
  if not answer:
    subprocess.call(["cp", "/etc/ssh/sshd_config", "/etc/ssh/backup.sshd_config"])
    port_ssh = input("Tell me a new port for ssh: ")
    #subprocess.Popen(["sed", "-i", "--", "'s/#Port 22/Port port_ssh/g'", "/etc/ssh/sshd_config"])
    sed('#Port 22', 'Port ' + port_ssh, '/etc/ssh/sshd_config')
    #subprocess.Popen(["sed", "-i", "--", "'s/#PermitRootLogin prohibit-password/PermitRootLogin no/g'", "/etc/ssh/sshd_config"])
    sed('#PermitRootLogin prohibit-password', 'PermitRootLogin no', '/etc/ssh/sshd_config')
    #subprocess.Popen(["sed", "-i", "--", "'s/#MaxAuthTries 6/MaxAuthTries 4/g'", "/etc/ssh/sshd_config"])
    sed('#MaxAuthTries 6', 'MaxAuthTries 2', '/etc/ssh/sshd_config')
    #subprocess.Popen(["sed", "-i", "--", "'s/#ClientAliveInterval 0/ClientAliveInterval 300/g'", "/etc/ssh/sshd_config"])
    sed('#ClientAliveInterval 0', 'ClientAliveInterval 300', '/etc/ssh/sshd_config')
    #subprocess.Popen(["sed", "-i", "--", "'s/#ClientAliveCountMax 3/ClientAliveCountMax 2/g'", "/etc/ssh/sshd_config"])
    sed('#ClientAliveCountMax 3', 'ClientAliveCountMax 2', '/etc/ssh/sshd_config')
    #subprocess.Popen(["sed", "-i", "--", "'s/#X11Forwarding yes/X11Forwarging no/g'", "/etc/ssh/sshd_config"])
    sed('#X11Forwarding yes', 'X11Forwarging no', '/etc/ssh/sshd_config')
    #subprocess.Popen(["sed", "-i", "--", "'s/#UseDns no/UseDNS yes/g'", "/etc/ssh/sshd_config"])
    sed('#UseDns no', 'UseDNS yes', '/etc/ssh/sshd_config')

    # PasswordAuthentication not use it when works with ssh keys
    #sed -i -- 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

    sed('#PasswordAuthentication yes', 'PasswordAuthentication yes', '/etc/ssh/sshd_config')
    #subprocess.Popen(["sed", "-i", "--", "'s/#PasswordEmptyPasswords no/PasswordEmptyPasswords yes/g'", "/etc/ssh/sshd_config"])
    sed('#PasswordEmptyPasswords no', 'PasswordEmptyPasswords yes', '/etc/ssh/sshd_config')

    sed('#HostKey /etc/ssh/ssh_host_dsa_key', 'HostKey /etc/ssh/ssh_host_dsa_key', '/etc/ssh/sshd_config')
    # sed -i '/HostKey \/etc\/ssh\/ssh_host_rsa_key/s/^#//' /etc/ssh/sshd_config
    sed('#HostKey /etc/ssh/ssh_host_rsa_key', '^#', '/etc/ssh/sshd_config')
    # sed('#HostKey /etc/ssh/ssh_host_rsa_key', 'HostKey /etc/ssh/ssh_host_rsa_key', '/etc/ssh/sshd_config')
    #sed('#HostKey /etc/ssh/ssh_host_rsa_key', 'RSAAuthentication yes', '/etc/ssh/sshd_config')
    #sed('#HostKey /etc/ssh/ssh_host_rsa_key', 'PubkeyAuthentication yes', '/etc/ssh/sshd_config')

    sed('/KeyRegenerationInterval', '^#', '/etc/ssh/sshd_config')

    subprocess.call(["mv", "motd", "/etc/motd"])
    subprocess.call(["mv", "banner", "/etc/issue"])
    #subprocess.Popen(["sed", "-i", "--", "'s/PrintMotd no/PrintMotd yes/g'", "/etc/ssh/sshd_config"])
    #sed('/PrintMotd no/PrintMotd yes', '/etc/ssh/sshd_config', '/etc/ssh/sshd_config')
    #subprocess.Popen(["sed", "-i", "--", "'s/#Banner none/Banner \/etc\/issue/g'", "/etc/ssh/sshd_config"])
    sed('#Banner none', 'Banner \/etc\/issue', '/etc/ssh/sshd_config')
    #echo "AllowUsers $user" /etc/ssh/sshd_config
    with open('/etc/ssh/sshd_config', 'a') as f:
      f.write('AllowUsers {} {}'.format(new_user, '\n'))
      # f.write('RSAAuthentication yes {}'.format('\n'))  # This options works just with Protocol version 2
      f.write('PubkeyAuthentication yes {}'.format('\n'))

    subprocess.call(["chmod", "600", "/etc/ssh/ssh_host_dsa_key"])
    subprocess.call(["chmod", "600", "/etc/ssh/ssh_host_rsa_key"])


def test_config_sshd():
  show_info("Test config sshd...")
  answer = skip_task()
  if not answer:
    test_sshd=subprocess.call(["sshd", "-t"])
    if test_sshd == 0:
      print('ssh config is ok... so restart it...')
      time.sleep(1)
      #show_info("Restarting sshd service...")
      subprocess.call(["systemctl", "restart", "sshd"])
      subprocess.call(["systemctl", "status", "sshd"])
    else:
      print('ssh has some problems... you should fix it')
      print(test_sshd)


def test_ssh_audit():
  show_info("Auditing ssh server...")
  print("SSH Audit is a tool for ssh server auditing, you can found it in https://github.com/arthepsy/ssh-audit")
  answer = skip_task()
  if not answer:
    home = expanduser("~")
    subprocess.call(["git","clone", "https://github.com/arthepsy/ssh-audit"], cwd=home)
    subprocess.call(["python", home + "/ssh-audit/ssh-audit.py", "localhost"])


def change_user(new_user):
  show_info("Changing to {}...".format(new_user))
  answer = skip_task()
  if not answer:
    subprocess.call(["su", "-", new_user])


def main():
  subprocess.call(["clear"])
  install_vim()
  change_root_password()
  new_user = add_new_user()
  regenerate_ssh_keys()
  regenerate_moduli()
  modify_config_sshd(new_user)
  test_config_sshd()
  test_ssh_audit()
  install_fail2ban()
  if new_user != '' is not None:
    change_user(new_user)



main()


