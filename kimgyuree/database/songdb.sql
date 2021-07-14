# 권한 설정
grant all privileges on  *.* to 'root'@'%' identified by 'mysql1234';
delete from mysql.user where host="localhost" and user="root";
flush privileges;
select host,user,plugin,authentication_string from mysql.user;

DROP DATABASE IF EXISTS songdb;
CREATE DATABASE IF NOT EXISTS songdb
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
    
use songdb;

CREATE TABLE singer (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    debut VARCHAR(30),
    agency VARCHAR(30),    #소속사
    fandom VARCHAR(20),
    PRIMARY KEY (id)
) ENGINE = INNODB
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
    
CREATE TABLE album (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100),
    sale VARCHAR(100),    #발매일
    title VARCHAR(100),
    sub1 VARCHAR(100),    #수록곡
    sub2 VARCHAR(100),
    sub3 VARCHAR(100),
    sub4 VARCHAR(100),
    PRIMARY KEY (id)
) ENGINE = INNODB
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
    
CREATE TABLE song (
    id INT NOT NULL AUTO_INCREMENT,
    singer_id INT,
    album_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (singer_id) REFERENCES singer (id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (album_id) REFERENCES album (id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = INNODB
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
    
CREATE TABLE image (
   id INT NOT NULL AUTO_INCREMENT,
   album_id INT NOT NULL,
   filename VARCHAR(255) NOT NULL,
   PRIMARY KEY (id),
   INDEX (album_id),
   FOREIGN KEY (album_id) REFERENCES album (id)
       ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
    DEFAULT CHARACTER SET utf8 
    DEFAULT COLLATE utf8_general_ci;
    
INSERT INTO singer VALUES
    (NULL, "소녀시대", "2007/08/05", "SM엔터테인먼트", "소원"),
    (NULL, "태연", "2015/10/07", "SM엔터테인먼트", "소원"),
    (NULL, "블랙핑크", "2016/08/08", "YG엔터테인먼트", "블링크"),
    (NULL, "백예린", "2012/10/05", "블루바이닐", NULL),
    (NULL, "에스파", "2020/11/17", "SM엔터테인먼트", "마이"),
    (NULL, "레드벨벳", "2014/08/01", "SM엔터테인먼트", "레베럽"),
    (NULL, "에프엑스", "2009/09/05", "SM엔터테인먼트", "미유"),
    (NULL, "비투비", "2012/03/21", "큐브엔터테인먼트", "멜로디"),
    (NULL, "샤이니", "2008/05/25", "SM엔터테인먼트", "샤이니월드"),
    (NULL, "악동뮤지션", "2014/04/07", "YG엔터테인먼트", NULL),
    (NULL, "오마이걸", "2015/04/21", "WM엔터테인먼트", "미라클"),
    (NULL, "다비치", "2008/02/22", "웨이크원엔터테인먼트", NULL),
    (NULL, "(여자)아이들", "2018/05/02", "큐브엔터테인먼트", "네버랜드"),
    (NULL, "브레이브걸스", "2016/02/16", "브레이브엔터테인먼트", "피어레스"),
    (NULL, "아이즈원", "2018/10/29", "스윙엔터테인먼트", "위즈원"),
    (NULL, "있지", "2019/02/12", "JYP엔터테인먼트", "믿지"),
    (NULL, "아이유", "2008/09/18", "이담엔터테인먼트", "유애나");

INSERT INTO album VALUES
    (NULL, "The Boys", "정규 3집", "2011/10/19", "The Boys", "텔레파시", "Oscar", "봄날", "Say Yes"),
    (NULL, "Holiday Night", "정규 6집", "2017/08/04", "Holiday", "All Night", "One Last Time", "Sweet Talk", "Light Up the Sky"),
    (NULL, "Gee", "미니 1집", "2009/01/05", "Gee", "힘내!", "Destiny", "Dear.mom", "힘들어하는 연인들을 위해"),
    (NULL, "Mr.Mr.", "미니 4집", "2014/02/24", "Mr.Mr.", "Goodbye", "Wait a Minute", "백허그", "Soul"),
    (NULL, "다시 만난 세계", "싱글 1집", "2007/08/03", "다시 만난 세계", "Beginning", "Perfect for you", NULL, NULL),
    (NULL, "My Voice", "정규 1집", "2017/02/28", "Fine", "Time Lapse", "날개", "Fire", "기억을 걷는 시간"),
    (NULL, "Purpose", "정규 2집", "20119/10/28", "불티", "Gravity", "Better Babe", "Wine", "Love You Like Crazy"),
    (NULL, "I", "미니 1집", "2015/10/07", "I", "U R", "쌍둥이자리", "스트레스", "먼저 말해줘"),
    (NULL, "Something New", "미니 3집", "2018/06/18", "Something New", "Circus", "바람 바람 바람", "저녁의 이유", "너의 생일"),
    (NULL, "The Album", "정규 1집", "2020/10/02", "Lovesick Girls", "Bet You Wanna", "You Never Know", "Pretty Savage", "Love To Hate Me"),
    (NULL, "SQUARE UP", "미니 1집", "2018/06/15", "뚜두뚜두", "Forever Young", "Really", "See U Later", NULL),
    (NULL, "KILL THIS LOVE", "미니 2집", "2019/04/05", "Kill This Love", "Don't Know What To Do", "Kick It", "아니길", NULL),
    (NULL, "Every letter I sent you.", "정규 1집", "2019/12/10", "Square", "Popo", "Datoom", "Mr.gloomy", "0310"),
    (NULL, "Our love is great", "미니 2집", "2019/03/18", "그건 아마 우리의 잘못은 아닐거야", "Dear my blue", "내가 날 모르는 것처럼", "야간비행", "지켜줄게"),
    (NULL, "Black Mamba", "디지털 싱글", "2020/11/17", "Black Mamba", NULL, NULL, NULL, NULL),
    (NULL, "Forever(약속)", "디지털 싱글", "2021/02/05", "Forever(약속)", NULL, NULL, NULL, NULL),
    (NULL, "Next Level", "디지털 싱글", "2021/05/17", "Next Level", NULL, NULL, NULL, NULL),
    (NULL, "Ice Cream Cake", "미니 1집", "2015/03/17", "Ice Cream Cake", "Automatic", "Somethin Kinda Crazy", "Stupid Cupid", "사탕 (Candy)"),
    (NULL, "'The ReVe Festival' Finale", "미니 6,7집 리패키지", "2019/12/23", "Psycho", "In & Out", "Remember Forever", "La Rouge", NULL),
    (NULL, "Pink Tape", "정규 2집", "2013/07/29", "첫 사랑니 (Rum Pum Pum Pum)", "Goodbye Summer", "Airplane", "미행 (그림자: Shadow)", "Pretty Girl"),
    (NULL, "4 Walls", "정규 4집", "2015/10/27", "4 Walls", "Deja Vu", "Diamond", "Cash Me Out", "Papi"),
    (NULL, "Brother Act.", "정규 2집", "2017/10/16", "그리워하다", "꿈에", "Finale : 우리들의 콘서트", "새빨간 거짓말", "Prelude : 하루"),
    (NULL, "THIS IS US", "미니 11집", "2018/06/18", "너 없인 안 된다", "Blue Moon", "1, 2, 3", "Call Me", "The Feeling"),
    (NULL, "Odd", "정규 4집", "2015/05/18", "View", "너의 노래가 되어 (An Ode To You)", "재연 (An Encore)", "Odd Eye", "Love Sick"),
    (NULL, "Don't Call Me", "정규 7집", "2021/02/22", "Don't Call Me", "I Really Want You", "Heart Attack", "Marry You", "Attention"),
    (NULL, "PLAY", "정규 1집", "2014/04/07", "200%", "Give Love", "얼음들", "작은별", "인공잔디"),
    (NULL, "항해", "정규 3집", "2019/09/25", "어떻게 이별까지 사랑하겠어, 널 사랑하는 거지", "물 만난 물고기", "밤 끝없는 밤", "시간을 갖자", "달"),
    (NULL, "NONSTOP", "미니 7집", "2020/04/27", "살짝 설렜어 (Nonstop)", "Dolphin", "꽃차 (Flower Tea)", "NEON", "Krystal"),
    (NULL, "Dear OHMYGIRL", "미니 8집", "2021/05/10", "Dun Dun Dance", "Dear You (나의 봄에게)", "Quest", "초대장", "Swan"),
    (NULL, "그냥 안아달란 말야", "디지털 싱글", "2021/04/12", "그냥 안아달란 말야", NULL, NULL, NULL, NULL),
    (NULL, "DUMDi DUMDi", "싱글 1집", "2020/08/03", "DUMDi DUMDi", NULL, NULL, NULL, NULL),
    (NULL, "I burn", "미니 4집", "2021/01/11", "화(火花)", "MOON", "Where is love", "LOST", "DAHLIA"),
    (NULL, "Rollin'", "미니 4집", "2017/03/07", "롤린(Rollin')", "옛 생각", "서두르지 마", "하이힐", NULL),
    (NULL, "We Ride", "디지털 싱글 4집", "2020/08/14", "운전만해", NULL, NULL, NULL, NULL),
    (NULL, "BLOOM*IZ", "정규 1집", "2020/02/17", "FIESTA", "SO CURIOUS", "AYAYAYA", "SPACESHIP", "YOU & I"),
    (NULL, "One-reeler", "미니 4집", "2020/12/07", "Panorama", "Island", "Sequence", "O Sole Mio", "느린 여행"),
    (NULL, "IT'z Different", "디지털 싱글 1집", "2019/02/12", "달라달라", "WANT IT?", NULL, NULL, NULL),
    (NULL, "IT'z ME", "미니 2집", "2020/03/09", "WANNABE", "NOBODY LIKE YOU", "24HRS", "YOU MAKE ME", "TING TING TING"),
    (NULL, "Palette", "정규 4집", "2017/04/21", "팔레트", "이 지금", "이름에게", "밤편지", "사랑이 잘"),
    (NULL, "Love poem", "미니 5집", "2019/11/18", "Blueming", "Love poem", "시간의 바깥", "자장가", "unlucky");
    
INSERT INTO song VALUES
    (NULL, 1, 1),
    (NULL, 1, 2),
    (NULL, 1, 3),
    (NULL, 1, 4),
    (NULL, 1, 5),
    (NULL, 2, 6),
    (NULL, 2, 7),
    (NULL, 2, 8),
    (NULL, 2, 9),
    (NULL, 3, 10),
    (NULL, 3, 11),
    (NULL, 3, 12),
    (NULL, 4, 13),
    (NULL, 4, 14),
    (NULL, 5, 15),
    (NULL, 5, 16),
    (NULL, 5, 17),
    (NULL, 6, 18),
    (NULL, 6, 19),
    (NULL, 7, 20),
    (NULL, 7, 21),
    (NULL, 8, 22),
    (NULL, 8, 23),
    (NULL, 9, 24),
    (NULL, 9, 25),
    (NULL, 10, 26),
    (NULL, 10, 27),
    (NULL, 11, 28),
    (NULL, 11, 29),
    (NULL, 12, 30),
    (NULL, 13, 31),
    (NULL, 13, 32),
    (NULL, 14, 33),
    (NULL, 14, 34),
    (NULL, 15, 35),
    (NULL, 15, 36),
    (NULL, 16, 37),
    (NULL, 16, 38),
    (NULL, 17, 39),
    (NULL, 17, 40);
    
INSERT INTO image VALUES
    (NULL, 1, "The Boys.jpg"),
    (NULL, 2, "Holiday Night.jpg"),
    (NULL, 3, "Gee.jpg"),
    (NULL, 4, "Mr.Mr..jpg"),
    (NULL, 5, "Into the New World.jpg"),
    (NULL, 6, "My Voice.jpg"),
    (NULL, 7, "Purpose.jpg"),
    (NULL, 8, "I.jpg"),
    (NULL, 9, "Something New.jpg"),
    (NULL, 10, "The Album.jpg"),
    (NULL, 11, "SQUARE UP.jpg"),
    (NULL, 12, "KILL THIS LOVE.jpg"),
    (NULL, 13, "Every letter I sent you..jpg"),
    (NULL, 14, "Our love is great.jpg"),
    (NULL, 15, "Black Mamba.jpg"),
    (NULL, 16, "Forever.jpg"),
    (NULL, 17, "Next Level.jpg"),
    (NULL, 18, "Ice Cream Cake.jpg"),
    (NULL, 19, "The ReVe Festival Finale.jpg"),
    (NULL, 20, "Pink Tape.jpg"),
    (NULL, 21, "4 Walls.jpg"),
    (NULL, 22, "Brother Act..jpg"),
    (NULL, 23, "THIS IS US.jpg"),
    (NULL, 24, "Odd.jpg"),
    (NULL, 25, "Dont Call Me.jpg"),
    (NULL, 26, "PLAY.jpg"),
    (NULL, 27, "Sailer.jpg"),
    (NULL, 28, "NONSTOP.jpg"),
    (NULL, 29, "Dear OHMYGIRL.jpg"),
    (NULL, 30, "just hug me.jpg"),
    (NULL, 31, "DUMDi DUMDi.jpg"),
    (NULL, 32, "I burn.jpg"),
    (NULL, 33, "Rollin.jpg"),
    (NULL, 34, "We Ride.jpg"),
    (NULL, 35, "BLOOMIZ.jpg"),
    (NULL, 36, "One-reeler.jpg"),
    (NULL, 37, "ITz Different.jpg"),
    (NULL, 38, "ITz ME.jpg"),
    (NULL, 39, "Palette.jpg"),
    (NULL, 40, "Love poem.jpg");

SELECT singer.name, album.title FROM singer, song, album WHERE singer.id = singer_id AND album_id = album.id;