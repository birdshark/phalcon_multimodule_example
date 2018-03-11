<?php

namespace Application\Common\Models;

class Gallery extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(column="id", type="integer", length=10, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(column="path", type="string", length=128, nullable=false)
     */
    public $path;

    /**
     *
     * @var string
     * @Column(column="size", type="string", length=11, nullable=false)
     */
    public $size;

    /**
     *
     * @var string
     * @Column(column="width", type="string", length=11, nullable=false)
     */
    public $width;

    /**
     *
     * @var string
     * @Column(column="height", type="string", length=11, nullable=false)
     */
    public $height;

    /**
     *
     * @var string
     * @Column(column="added_on", type="string", nullable=false)
     */
    public $added_on;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("gallery");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'gallery';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gallery[]|Gallery|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gallery|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
