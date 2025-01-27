const express = require('express')
const router = express.Router()

const authToken = require('../middlewares/auth')

const { createBooking, updateSchedule, changeStatus, changeReview, changeRating, getBookingsByExpert, getBookingsByAspirant } = require('../controllers/booking')

router.route('/experts').get(authToken, getBookingsByExpert)
router.route('/aspirants').get(authToken, getBookingsByAspirant)
router.route('/create').post(authToken, createBooking)
router.route('/update/schedule').put(authToken, updateSchedule)
router.route('/update/status').put(authToken, changeStatus)
router.route('/update/review').put(authToken, changeReview)
router.route('/update/rating').put(authToken, changeRating)

module.exports = router;

