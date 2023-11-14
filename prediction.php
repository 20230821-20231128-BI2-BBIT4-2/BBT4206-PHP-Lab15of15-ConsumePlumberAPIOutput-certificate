<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Symptom_1 = $_POST['Symptom_1'];
    $Symptom_2 = $_POST['Symptom_2'];
    $Symptom_3 = $_POST['Symptom_3'];
    $Symptom_4 = $_POST['Symptom_4'];
    $Symptom_5 = $_POST['Symptom_5'];
    $Symptom_6 = $_POST['Symptom_6'];
    $Symptom_7 = $_POST['Symptom_7'];
    $Symptom_8 = $_POST['Symptom_8'];    

    // API endpoint URL
    //$apiUrl = 'http://127.0.0.1:5022/symptoms';
    $apiUrl = 'http://127.0.0.1:5022/__docs__/#/default/get_predict_disease';

    // Create cURL request with symptoms data
    $curl = curl_init();
    $params = array(
        'Symptom_1' => $Symptom_1,
        'Symptom_2' => $Symptom_2,
        'Symptom_3' => $Symptom_3,
        'Symptom_4' => $Symptom_4,
        'Symptom_5' => $Symptom_5,
        'Symptom_6' => $Symptom_6,
        'Symptom_7' => $Symptom_7,
        'Symptom_8' => $Symptom_8
        // Add other symptoms to the $params array
    );
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    $apiUrl = $apiUrl . '?' . http_build_query($params);
    curl_setopt($curl, CURLOPT_URL, $apiUrl);
    $response = curl_exec($curl);
    curl_close($curl);

    // Decode JSON response
    $data = json_decode($response, true);

    // Display prediction result
    if (isset($data['0'])) {
        echo "The predicted status is:<br>";
        foreach ($data as $repository) {
            echo $repository['0'], $repository['1'], $repository['2'], "<br>";
        }
    } else {
        echo "API Error: " . $data['message'];
    }
}
?>
