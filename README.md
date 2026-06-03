# LED Fun

This is an evaluation project to gain some experience and familiarity with Elixir, Nerves, and basic hardware setup.

The tasks below are sequential and purposefully open ended to promote freeform exploration. Use any and all resources available to you including project websites, forums, and discord servers. The community is especially welcoming and active in the Nerves discord server. Leveraging AI is highly encourage. [Claude Code](https://claude.com/pricing) is the tool we use internally and a paid plan can be worth it, though not required.

## Tasks

- [x] Create a GitHub repository to host the project
  - [x] Add @jjcarstens as a collaborator to be able to review PRs
- [x] Get an initial firmware running on the rpi0
- [x] Update firmware to blink an LED on and off every sec
- [x] Update firmware to turn LED on or off when a button is pressed
- [ ] Bonus actions:
  - Blink multiple LEDS in sequence
  - Use multiple buttons to perform different actions such as:
    - Turn different LEDs on or off
    - Increase or decrease speed of LED blink
    - Cycle through which LED is on/off
  - Require specific button sequence to perform specific action. Button sequence ideas:
    - Double press
    - Long button hold
    - Button 1 and Button 2 pressed at same time
    - Button 1 then button 2

## PR Guidelines

> _"Make it work, then make it beauitful, then if you really, really have to, make it fast"_
>   - _Joe Armstrong, creator of Erlang_

- The reviewers goal is to review for understanding, not just catch mistakes. Therefore, the creators goal should be organizing changes to be easily understood
- Smaller, frequent changes are generally better than larger, infrequent changes. However, some size cannot be avoided. In such cases, focus on ease of understanding
- Make commits useful to the context
  - Avoid vague, transient descriptions such as "oops" or "trying again...", etc
  - Avoid conventional commits and write for humans. Include a subject and, if applicable, a useful description about what the change is and why it is needed.
- When dealing with larger sets of changes, group relevant changes by commit. That way a reviewer can walk through each commit to review smaller pieces at a time.
