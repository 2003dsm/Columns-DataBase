DELIMITER $$

CREATE PROCEDURE ExistUser(IN name1 VARCHAR(45),IN password1 VARCHAR(45))
BEGIN
	select * 
    from User 
    WHERE 
    name = name1 
    AND password = password1;
    
END$$

CREATE PROCEDURE GetLastUserIP()
BEGIN
SELECT idUser FROM User ORDER BY idUser DESC LIMIT 1;
    
END$$
CREATE PROCEDURE GetLastMatchIP()
BEGIN
SELECT idPartida FROM Partida ORDER BY idPartida DESC LIMIT 1;
    
END$$
CREATE PROCEDURE GetLastRoomIP()
BEGIN
SELECT idRoom FROM Room ORDER BY idRoom DESC LIMIT 1;
    
END$$
CREATE PROCEDURE CreateNewUser(IN name1 VARCHAR(45),IN password1 VARCHAR(45))
BEGIN
INSERT INTO User(name,Room_idRoom,password) VALUES(name1,null,password1);    
END$$

CREATE PROCEDURE GetMatchs()
BEGIN
select * from Partida;
END$$

CREATE PROCEDURE GetRep(IN userID int,IN roomID integer,IN replayID integer, IN frame1 integer)
BEGIN

select * from UpdateGrid 
WHERE 
Partida_User_idUser = userID 
AND 
Partida_User_Room_idRoom = roomID 
AND 
Partida_idPartida =replayID
AND 
frame =frame1;

END$$


CREATE PROCEDURE CreateRoom()
BEGIN
insert into Room(name) values('');
END$$

CREATE PROCEDURE GetAllPlayersInRoom(IN roomID integer)
BEGIN
SELECT idUser FROM User WHERE Room_idRoom =roomID;
END$$

CREATE PROCEDURE MovePlayerInRooms(IN roomID integer, IN playerID integer)
BEGIN
UPDATE User SET Room_idRoom = roomID WHERE idUser = playerID;
END$$

CREATE PROCEDURE InsertUpdateGrid(IN roomID integer, IN playerID integer,IN frame integer,IN matchID integer,IN x integer,IN y integer,IN color integer)
BEGIN
INSERT INTO UpdateGrid
(frame,
x,
y,
color,
Partida_idPartida,
Partida_User_idUser,
Partida_User_Room_idRoom) 
VALUES(frame,x,y,color,matchID,playerID,roomID);
END$$

CREATE PROCEDURE CreateMatch(IN roomID integer, IN playerID integer)
BEGIN
SELECT name FROM User WHERE idUser = playerID;

insert into Partida(name,User_idUser,User_Room_idRoom) values(
(SELECT name FROM User WHERE idUser = playerID)
,
playerID ,roomID);
END$$
DELIMITER ;

