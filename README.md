# README

Live demo: [Click Here](https://anvil-technical-assessment.herokuapp.com/)

## Anvil Property Smith Technical Assessment
### Chess club administration

#### Introduction
The local chess club wants to keep track of their members. The main thing that they want to
keep track of, is the ranking of each member. They need a basic system to Create, Show
Update and Delete members.
They only need basic information about each member:
- Name and surname
- Email address
- Birthday
- Number of club games played
- Current rank

#### Ranking
Each member is ranked f rom 1..n. Where 1 is the top player in the club and n is the lowestranked player in the club.
When players play a match, their ranks can change, based on the following rules:  

• If the higher-ranked player wins against their opponent, neither of their ranks
change  
• If it’s a draw, the lower-ranked player can gain one position, unless the two players
are adjacent.  

So if the players are ranked 10th and 11th, and it’s a draw, no change in ranking
takes place. But if the players are ranked 10th and 15th, and it’s a draw, the player
with rank 15 will move up to rank 14 and the player with rank 10 will stay the same.  

• If the lower-ranked player beats a higher-ranked player, the higher-ranked player
will move one rank down, and the lower level player will move up by half the
difference between their original ranks.

For example, if players ranked 10th and 16th play and the lower-ranked player wins, the
first player will move to rank 11th and the other player will move to rank (16 - 10) / 2 = 3
placed up, to rank 13th

#### The Application
Write a simple application that will help the chess club administer their players. The
application will need all the basic CRUD operations.
New players will, by default, be ranked last.  
The application will also need a facility to enter a match between two players and then
update their ranks accordingly.  
A leader board view will be used by the club.

NB: YOU DO NOT NEED TO IMPLEMENT THE ACTUAL GAME OF CHESS, JUST A SYSTEM TO
MANAGE RANKINGS AND SCORES

#### Your assignment
We don’t need you to spend too much time on this. This is more to get a view of your
thought process and see the quality of your code.

1. Start a new repository on GitHub for this project.
2. Commit early and often, so we can see your thought process.
3. You should write tests in RSpec.
4. We don’t need an award-winning design for the app either, but a pleasant interface
   will be appreciated
5. We will go through a code review process together, so we can discuss your thinking
   in designing this simple application.

Time Required: 3 – 6 Hours

Good luck, and enjoy!