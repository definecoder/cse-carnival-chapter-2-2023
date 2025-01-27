const { pool } = require('../db/connect')


const createExpert = async (req, res) => {

    // id	name	email	phone	gender	photoLink	originCountry	originCollage	country	university	fieldOfStudy	program	session	language	expertise	bio	background	achievements	socialMedia	hourlyCharge	visaPhotoLink	studentIDPhotoLink	locationLink	noOfServiceProvided	totalIncome	isApproved

    console.log('nafi hit server...')

    try {
        let { name, email, phone, gender, photoLink, originCountry, originCollage, country, university, fieldOfStudy, program, session, language, expertise, bio, background, achievements, socialMedia, hourlyCharge, visaPhotoLink, studentIDPhotoLink, locationX, locationY } = req.body;

        // email = 'ex1@gmail.com'

        if (!gender) {
            gender = 0
        }

        if (!hourlyCharge) {
            hourlyCharge = 0
        }
        if (!locationX) {
            locationX = 0
        }
        if (!locationY) {
            locationY = 0
        }

        noOfServiceProvided = 0
        totalIncome = 0
        isApproved = 0


        const sql = `
            INSERT INTO expert(name, email, phone, gender, photoLink, originCountry, originCollage, country, university, fieldOfStudy, program, session, language, expertise, bio, background, achievements, socialMedia, hourlyCharge, visaPhotoLink, studentIDPhotoLink, locationX, locationY, noOfServiceProvided, totalIncome, isApproved)
            VALUES('${name}', '${email}', '${phone}', '${gender}', '${photoLink}', '${originCountry}', '${originCollage}', '${country}', '${university}' ,'${fieldOfStudy}', '${program}', '${session}', '${language}' ,'${expertise}', '${bio}', '${background}', '${achievements}', '${socialMedia}', '${hourlyCharge}', '${visaPhotoLink}', '${studentIDPhotoLink}', '${locationX}', '${locationY}', '${noOfServiceProvided}', '${totalIncome}', '${isApproved}')
        `
        await pool.query(sql)

        res.sendStatus(200);
    } catch (err) {
        console.log(err)
        res.sendStatus(500);
    }

}

const getExpert = async (req, res) => {



    const { id } = req.params;

    console.log('hit by ' + id)

    try {
        const sql = `
            SELECT * FROM expert
            WHERE id = ${id}
        `

        const data = await pool.query(sql)

        res.status(200).json(data[0])
    } catch (err) {
        console.log(err)

        res.sendStatus(500);
    }

}

const getAllExperts = async (req, res) => {
    try {
        const sql = `
            SELECT * FROM expert
        `
        const data = await pool.query(sql)

        res.json(data[0]);

    } catch (err) {
        console.log(err)
        res.sendStatus(500);
    }
}

const getUnapprovedExperts = async (req, res) => {

    console.log('api hit')

    try {
        const sql = `
            SELECT * FROM expert
            WHERE isApproved = 0
        `
        const data = await pool.query(sql)

        res.json(data[0]);

    } catch (err) {
        console.log(err)
        res.sendStatus(500);
    }
}


const approveExpert = async (req, res) => {
    try {

        const { id } = req.body;

        const sql = `
            UPDATE expert
            SET isApproved = 1
            WHERE id = ${id}
        `
        await pool.query(sql)
        res.sendStatus(200);

    }
    catch (err) {
        res.sendStatus(500);
    }

}

module.exports = {
    createExpert,
    getExpert,
    getAllExperts,
    getUnapprovedExperts,
    approveExpert
}



