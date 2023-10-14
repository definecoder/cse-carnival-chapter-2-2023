const { pool } = require('../db/connect')


// 

const createAspirant = async (req, res) => {

    try {
        let { name, email, phone, gender, photoLink, currentInstitution, originCountry, destinations, intentedStudyFields, goals, questions, language, intendedSession, scolarshipNeed } = req.body;

        // console.log(name, email, phone, gender, photoLink, currentInstitution, originCountry, destinations, intentedStudyFields, goals, questions, language, intendedSession, scolarshipNeed);

        // id	name	email	phone	gender	photoLink	currentInstitution	originCountry	destinations	intentedStudyFields	goals	questions	language	intendedSession	scolarshipNeed

        if (!gender) {
            gender = 0
        }
        if (!scolarshipNeed) {
            scolarshipNeed = 0
        }

        const sql = `
            INSERT INTO aspirant(name, email, phone, gender, photoLink, currentInstitution, originCountry, destinations, intentedStudyFields, goals, questions, language, intendedSession, scolarshipNeed)
            VALUES('${name}', '${email}', '${phone}', '${gender}', '${photoLink}', '${currentInstitution}', '${originCountry}', '${destinations}', '${intentedStudyFields}' ,'${goals}', '${questions}', '${language}' ,'${intendedSession}', '${scolarshipNeed}')
        `
        await pool.query(sql)

        res.send('done')
    } catch (err) {
        console.log(err)
    }

}


// const deleteAspirant

const getAllAspirant = async () => {
    try {
        const sql = `
            SELECT * FROM aspirant
        `
        const data = await pool.query(sql)

        return data[0]

    } catch (err) {
        console.log(err)
    }
}

const getAspirant = async (id) => {
    try {
        const sql = `
            SELECT * FROM aspirant
            WHERE id = ${id}
        `

        const data = await pool.query(sql)

        return data[0]
    } catch (err) {

    }


}


// getAllAspirant().then(result => {

// }).catch(err => {

// })

// getAspirant(4).then(dat => {

// }).catch(err => {

// })

module.exports = {
    createAspirant,
    getAllAspirant,
    getAspirant
}


