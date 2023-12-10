# 1:- Using Database
use wc_2023;

# 2:- Viewing 1st 5 rows For Batting?
select * from wc_bat limit 5;

# 3:- Count The Number Of Records?
select count(*) as number_of_records from wc_bat;

# 4:- Show The Number Of Innings By Batsman And Rank Them?
select player,count(player) as number_of_innings_players_batting,dense_rank() over(order by count(player) desc) as rank_innings_players_batting from wc_bat  
group by player;

# 5:- Show The Numbers Of Four,Amount Of Runs Through Four And Rank Them?
create view 4s as 
(select player,sum(4s) as sum_of_4s_players_batting,dense_rank() over(order by sum(4s) desc) as rank_4s_players_batting from wc_bat  
group by player);
select * from 4s;

# 6:- Show Amount Of 4s Scored By Batsman?
select *,sum_of_4s_players_batting*4 as number_of_run_4s from 4s;

# 7:- Show The Numbers Of Four,Sixes,Amount Of Runs Through Sixes By Batsman And Rank Them?
create view 6s as 
(select player,sum(6s) as sum_of_6s_players_batting,dense_rank() over(order by sum(6s) desc) as rank_6s_players_batting from wc_bat  
group by player);
select * from 6s;

# 8:- Show Amount Of 6s Scored By Batsman?
select *,sum_of_6s_players_batting*6 as number_of_run_6s from 6s;

# 9:- Find The Average Srtike Rates By Batsman And Rank Them?
select player,avg(strike_rate) as average_strike_rate,dense_rank() over(order by avg(strike_rate) desc) as rank_strike_rate from wc_bat 
group by player;

# 10- Find The Average Srtike Rates By Batsman And Rank Them On The Basis Of Their Innings?
select player,avg(strike_rate) as average_strike_rate,count(player) as number_of_innings_players_batting,dense_rank() over(order by avg(strike_rate) desc) as rank_strike_rate,dense_rank() over(order by count(player) desc) as rank_innings_players_batting from wc_bat 
group by player;

# 11:- Find The Number Of Runs Scored By Batsman And Rank Them?
select player,sum(runs) as runs_scored,dense_rank() over(order by sum(runs) desc) as runs_rank from wc_bat
group by player;

# 12:- Find The Number Of Runs Scored By Batsman And Rank Them On The Basis Of Their Innings?
select player,sum(runs) as runs_scored,count(player) as number_of_innings_players_batting,dense_rank() over(order by sum(runs) desc) as runs_rank,dense_rank() over(order by count(player) desc) as rank_innings_players_batting from wc_bat
group by player;

# 13:- Find The Batsman Who Has Spent Maximum Time On Ground In Hours?
select player,sum(minutes)/60 as time_spent_ground,dense_rank() over(order by sum(minutes)/60 desc) as time_spent_rank from wc_bat
group by player;

# 14:- Viewing 1st 5 rows For Bowling?
select * from wc_bowl limit 5;

# 15:- Find The Bowler Who Has Given Highest Runs And Rank Them?
select player,sum(runs) as run_player,dense_rank() over(order by sum(runs) desc) as rank_runs from wc_bowl 
group by player;

# 16:- Find The Bowler Who Has Given Highest Runs And Rank Them On The Basis Of Their Innings?
select player,sum(runs) as run_player,count(player) as number_of_innings_players_bowling,dense_rank() over(order by sum(runs) desc) as rank_runs,dense_rank() over(order by count(player) desc) as rank_innings_players_bowling from wc_bowl 
group by player;

# 17:- Find The Bowler Who Has Taken Highest Wicket And Rank Them?
select player,sum(wickets) as wicket_player,dense_rank() over(order by sum(wickets) desc) as rank_wickets from wc_bowl 
group by player;

# 18:- Find The Bowler Who Has Taken Highest Wicket And Rank Them On The Basis Of Their Innings?
select player,sum(wickets) as wicket_player,count(player) as number_of_innings_players_bowling,dense_rank() over(order by sum(wickets) desc) as rank_wickets,dense_rank() over(order by count(player) desc) as rank_innings_players_bowling from wc_bowl 
group by player;

# 19:- Find The Players Who Has Given Maiden Overs?
create view maiden as
(select player,maidens from wc_bowl where maidens!=0);
select * from maiden;

# 20:- Find The Sum Of Maiden Overs By Bowlers And Rank Them?
select player,sum(maidens) as maiden_total,dense_rank() over(order by sum(maidens) desc) as rank_maiden from maiden 
group by player;

# 21:- Find The Players Who Has Given No Balls?
create view noball as
(select player,nb from wc_bowl where nb!=0);
select * from noball;

# 22:- Find The Sum Of No Balls By Bowlers And Rank Them?
select player,sum(nb) as noball_total,dense_rank() over(order by sum(nb) desc) as rank_noball from noball 
group by player;











