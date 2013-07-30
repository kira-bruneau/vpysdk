import lib.vpysdk as vp

username  = "USERNAME"
password  = "PASSWORD"
botname   = "GreeterBot"
worldname = "VP-Build"

def event_avatar_add(bot):
  bot.say("Hello, " + bot.string_get(vp.AVATAR_NAME) + "!")

def main():
  bot = vp.create()
  
  err = bot.connect("universe.virtualparadise.org", 57000)
  if err:
    print "Could not connect to universe (reason " + str(err) + ")"
    return
  
  err = bot.login(username, password, botname)
  if err:
    print "Could not login (reason " + str(err) + ")"
    return
  
  err = bot.enter(worldname)
  if err:
    print "Could not enter world (reason " + str(err) + ")"
    return
  
  bot.event_set(vp.EVENT_AVATAR_ADD, event_avatar_add)
  
  bot.state_change()
  
  print "Bot Loaded!"
  
  while bot.wait(1000) == 0:
    pass

main()
