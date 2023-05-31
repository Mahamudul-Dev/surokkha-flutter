class Api {
  static const BASE_URL =
      'https://surokkha.gov.bd.verify.foreigner-online.xyz/';

  // for getting all previous submission data.
  //this endpoint required firebase uid for getting spacific user submission documents
  static const GET_DATA = 'api/get-data/';

  // this endpoint used for generate pdf or submit vaccination certificate data
  static const GENERATE_PDF = 'api/generate-pdf';

  //this endpoint for delete any pdf from server
  static const DELETE_PDF = 'api/delete-data/';
}
